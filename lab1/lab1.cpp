#include <iostream>
#include <math.h>
#include <iomanip>
#include <windows.h>

long double sumc(long long n){
    long double pi = 0;
    
    for (long long i = 0; i <= n; i++){
        if(i % 2 == 0)
            pi += 4*((long double)(1/(2*i+1)));
        else
            pi -= 4*((long double)(1/(2*i+1)));
    }

    return pi;
}

int main(){
    long long n;
    std::cin >> n;

    //freq количество тиков в секунду
    LARGE_INTEGER freq, start, end;

    // 1. Получаем частоту счётчика
    if (!QueryPerformanceFrequency(&freq)) {
        std::cerr << "QueryPerformanceFrequency failed\n";
        return 1;
    }

    // 2. Снимаем начальное показание
    QueryPerformanceCounter(&start);
    
    long double pi = sumc(n);

    QueryPerformanceCounter(&end);

    double full_time = double(end.QuadPart - start.QuadPart) / double(freq.QuadPart);

    long double tick = 1.0/ (long double)freq.QuadPart;//длительность одного тика секунд  (абсолютная погрешность таймера)
    
    long double otn_pog = tick/full_time  * 100; // относительная погрешность в %
    

    std::cout << std::setprecision(15) << pi << '\n' << full_time << '\n';
    std::cout << std::setprecision(15) << otn_pog;

    return 0;
}
