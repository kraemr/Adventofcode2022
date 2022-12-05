
using System.Collections.Generic;
using System;
namespace AdventofCode2022
{



    class hmm {         
        // move n crates from from to stack
        public static Stack<char>[] stacks;

        static void move_crates(int n,int from,int to ){
         //   System.Console.WriteLine($"{n} {from} {to}");
           for(int i = 0; i < n;i++){
            char ch = stacks[from].Pop();
            stacks[to].Push(ch);
           }
        }

        static void CrateMover9001(int n,int from,int to){
            Stack<char> tempstack = new Stack<char>();
            // First pop and push n items onto tempstack
            char ch;
            for(int i = 0; i < n; i++){
                ch = stacks[from].Pop();
                tempstack.Push(ch);
            }
            for(int i = 0; i < n; i++){
                ch = tempstack.Pop();
                stacks[to].Push(ch);
            }

        }


    
        static void Main(string[] args)
        {
            stacks = new Stack<char>[9];
            for(int i = 0; i < 9;i++) stacks[i] = new Stack<char>();
            char temp = 'l';
            char[ , ] crates= new char[,] {
                {'G','W','L','J','B','R','T','D'},
                {' ',' ',' ',' ',' ','C','W','S'},
                {' ',' ',' ',' ','M','T','Z','R'},
                {' ','V','P','S','H','C','T','D'},
                {' ',' ','Z','D','L','T','P','G'},
                {'D','C','Q','J','Z','R','B','F'},
                {'R','T','F','M','J','D','B','S'},
                {' ','M','V','T','B','R','H','L'},
                {' ',' ',' ','V','S','D','P','Q'} 
            };
            int k = 0;
            foreach (Stack<char> st in stacks){
                for(int j = 7; j >= 0; j--){
                    if(crates[k,j] != ' ')st.Push(crates[k,j]);
                }
                k++;
            }
           
            string[] separator = {"move","from","to"," "};
            foreach (string line in System.IO.File.ReadLines(@"input.txt"))
            {  
                string[] strl = line.Split(separator,3,StringSplitOptions.RemoveEmptyEntries);
               //part 1// if(strl != null) move_crates(int.Parse(strl[0]),int.Parse(strl[1])-1,int.Parse(strl[2])-1);
                //part2
                CrateMover9001(int.Parse(strl[0]),int.Parse(strl[1])-1,int.Parse(strl[2])-1);
            } 


            for(int i = 0; i < 9;i++){
                System.Console.WriteLine(stacks[i].Peek());
            }
            //move_crates(1,4,7);
        }
    
    }
}