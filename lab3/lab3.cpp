#include <iostream>
#include <iomanip>
#include <windows.h>

long double sumc(long long n){
    long double pi = 0;
    
    for (long long i = 0; i <= n; i++){
        if(i % 2 == 0)
            pi += 4*((long double)(1.0/(2.0*i+1)));
        else
            pi -= 4*((long double)(1.0/(2.0*i+1)));
    }
    return pi;
}

int main(){
    long long n;
    std::cin >> n;
    
    long double pi = sumc(n);

    
    std::cout << std::setprecision(15) << pi;

    return 0;
}
