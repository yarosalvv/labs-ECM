#include <opencv2/opencv.hpp>
#include <iostream>

using namespace cv;
using namespace std;

int main() {
    
    VideoCapture capture(0); 
    
    if (!capture.isOpened()) {
        cerr << "Ошибка: не удалось открыть камеру!" << endl;
        return -1;
    }

    Mat frame; 

    // Переменные для расчета FPS
    int frameCount = 0;
    double fps = 0.0;
    double t0 = (double)cv::getTickCount(); 

    double frameProcessStart = 0;
    double frameProcessEnd = 0;
    double processTimeSec = 0;

    double time1, time2, time3;
    double timeInput, timeProcess, timeOutput;


    while (true) {
        // Засекаем время начала обработки
        frameProcessStart = (double)cv::getTickCount();
        
        capture >> frame; 
        
        time1 = (double)cv::getTickCount();

        if (frame.empty()) {
            cerr << "Пустой кадр. Завершение." << endl;
            break;
        }
         
        // Уменьшаем разрешение для снижения нагрузки
        cv::resize(frame, frame, cv::Size(500, 500));


        // 2. Произвольное преобразование: перевод в оттенки серого вручную
        for (int y = 0; y < frame.rows; y++) {
            for (int x = 0; x < frame.cols; x++) {
                
                uchar b = frame.at<cv::Vec3b>(y, x)[0];
                uchar g = frame.at<cv::Vec3b>(y, x)[1];
                uchar r = frame.at<cv::Vec3b>(y, x)[2];
            
                uchar gray_value = (b + g + r) / 3;
                
                // Записываем среднее значение во все три канала
                frame.at<cv::Vec3b>(y, x)[0] = gray_value;
                frame.at<cv::Vec3b>(y, x)[1] = gray_value;
                frame.at<cv::Vec3b>(y, x)[2] = gray_value;
            }
        }
        time2 = (double)cv::getTickCount();
        

        // Показываем кадр
        imshow("test", frame);
        

        // конца обработки
        frameProcessEnd = (double)cv::getTickCount();
        
        // время обработки одного кадра в сек
        processTimeSec = (frameProcessEnd - frameProcessStart) / cv::getTickFrequency(); 

        int waitTimeMs = 1;
        char c = (char)waitKey(waitTimeMs);
        if (c == 27) break; // Выход по ESC

        frameCount++;
        
        double t1 = (double)cv::getTickCount();
        double elapsedSec = (t1 - t0) / cv::getTickFrequency();


        // в секундах
        timeInput= (time1 - frameProcessStart) / cv::getTickFrequency();
        timeProcess = (time2 - time1) / cv::getTickFrequency();
        timeOutput = (frameProcessEnd - time2) / cv::getTickFrequency();

        if (elapsedSec >= 1.0) {
            fps = frameCount / elapsedSec;
            frameCount = 0;
            t0 = t1;
            
            double processTimeMs = processTimeSec * 1000.0; 
            double totalFrameTimeMs = processTimeMs + waitTimeMs;
            double LoadPercent = (processTimeMs / totalFrameTimeMs) * 100.0;


           // Переводим все времена в миллисекунды 
            double timeInput_ms = timeInput * 1000.0;
            double timeProcess_ms = timeProcess * 1000.0;
            double timeOutput_ms = timeOutput * 1000.0;
            
            double percent_input = (timeInput_ms / totalFrameTimeMs) * 100.0;
            double percent_process = (timeProcess_ms / totalFrameTimeMs) * 100.0;
            double percent_output = (timeOutput_ms / totalFrameTimeMs) * 100.0;

            cout << "FPS: " << fps << '\n';
            cout << "Processing time: " << processTimeSec << " sec (" << processTimeMs << " ms)\n";
            cout << "The share of time spent on processing: " << LoadPercent << "%\n";
            cout << "time Input" << percent_input << "%\n";
            cout << "time process" << percent_process << "%\n";
            cout << "time output" << percent_output << "%\n";
         }
    }

    capture.release();
    destroyAllWindows(); 
    
    return 0;
}