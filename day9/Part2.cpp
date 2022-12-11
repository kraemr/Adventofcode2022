// Part2 is in cpp because java is ASS
#include <utility>
#include <vector>
std::vector<std::pair<int, int>> visited;
std::vector<std::pair<int, int>> ropepos;

std::pair get_mv(char mov){
    std::pair temp = std::pair(0,0);
    switch(mov)
    {
        case 'U':temp.second++ ;break;
        case 'D':temp.second-- ;break;
        case 'R':temp.first++ ;break;
        case 'L':temp.first-- ;break;
    }
    return temp;
}
int move(char cmd, int n){
    
    //first move the head then move every tail part
  
    std::pair<int,int> temp = get_mv(cmd);
    ropepos[0].first += temp.first;
    ropepos[0].second += temp.second;
    visited.push_back(ropepos[0]);
    int deltax = 0;
    int deltay = 0;
    for(int i = 1; i < n; i++){

    }

}

int main(){
    
    for(int i = 0; i < 10 ; i++){
        ropepos.push_back(std::pair<int, int>(0,0));
    }
    visited.push_back(ropepos[0]);



}