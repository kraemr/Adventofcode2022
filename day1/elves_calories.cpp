

#include <fstream>
#include <string>
#include <iostream>
#include <unordered_map>
#include <vector>
std::unordered_map< int, int> elve_calorymap;


int pown(int n, int pow){
    if(n == 0) return 0;
    int orig = n;
    for(int i = 1; i < pow;i++ ){
        n *=  orig;
    }
    return n;
}

 int convert_string(std::string str){
    int result=0;
    int pownum=1;
    for(int i = str.length()-1;i >= 0;i--){
           // result += (str[i]-48) * pown(10,pownum);
            if(i == str.length()-1){
                result += (str[i]-48);
            }
            else{ 
                result += (str[i]-48) * pown(10,pownum);
                pownum++;
            }

    }
    //std::cout << result << std::endl;
    return result;
}

int find_highest(int elve_count){
     int highest = 0;
     int highest_i = 0;
    for(int i = 0; i < elve_count;i++){
       // std::cout<< elve_calorymap[i]<<std::endl;
        if( highest < elve_calorymap[i]){ 
            highest = elve_calorymap[i];
            highest_i = i;
        }
    }
    //remove highest value
    elve_calorymap[highest_i] = 0;
    return highest;
}



int find_top(int top,int elve_count){
    int result = 0;
    for(int i = 0; i < top;i++){
        result += find_highest(elve_count);
    }
    return result;
}

int main(){
std::ifstream infile("input.txt");
std::string line;
//std::cout << pown(10,1);
    int elve_i = 0;
    while (std::getline(infile, line))
    {
        if(line != ""){
        //std::cout << line <<std::endl;
        elve_calorymap[elve_i] += convert_string(line);
        }
        else{
            elve_i++;
        }
    }
    
    //int result = find_highest(elve_i);
    std::cout << find_top(3,elve_i);

    //std::cout << result;

}