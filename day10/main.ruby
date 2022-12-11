
$cyclecount = 0
$register = 1 
$signalsum = 0
$spritepos = 0

class String
    def black;          "\e[30m#{self}\e[0m" end
    def red;            "\e[31m#{self}\e[0m" end
    def green;          "\e[32m#{self}\e[0m" end
    def brown;          "\e[33m#{self}\e[0m" end
    def blue;           "\e[34m#{self}\e[0m" end
    def magenta;        "\e[35m#{self}\e[0m" end
    def cyan;           "\e[36m#{self}\e[0m" end
    def gray;           "\e[37m#{self}\e[0m" end
    def bg_black;       "\e[40m#{self}\e[0m" end
    def bg_red;         "\e[41m#{self}\e[0m" end
    def bg_green;       "\e[42m#{self}\e[0m" end
    def bg_brown;       "\e[43m#{self}\e[0m" end
    def bg_blue;        "\e[44m#{self}\e[0m" end
    def bg_magenta;     "\e[45m#{self}\e[0m" end
    def bg_cyan;        "\e[46m#{self}\e[0m" end
    def bg_gray;        "\e[47m#{self}\e[0m" end
    def bold;           "\e[1m#{self}\e[22m" end
    def italic;         "\e[3m#{self}\e[23m" end
    def underline;      "\e[4m#{self}\e[24m" end
    def blink;          "\e[5m#{self}\e[25m" end
    def reverse_color;  "\e[7m#{self}\e[27m" end
end

def handle_pixel()
   $cyclecount+=1
   $crt_screen[($cyclecount-1)/40][($cyclecount-1)%40] = ($register-(($cyclecount-1)%40)).abs <= 1 ? '░' : ' ' ;
end

def calc_signal()
    if $cyclecount == 20 || $cyclecount == 60 || $cyclecount == 100 || $cyclecount == 140 || $cyclecount == 180 || $cyclecount == 220
         $signalsum += $register * $cyclecount
     end
end


def cycle(line)
    spl = line.split(/ /,2)
    cmd = spl[0].strip()
    n = spl[1].to_i
    if cmd == "noop"
        handle_pixel()
        calc_signal()
    else 
        handle_pixel()        
        calc_signal()
        handle_pixel()        
        calc_signal()
        $register += n
    end
end

def PrintCRT()
    i = 0
    j = 0
    until i == 6 do
        j=0
        print("\n")
            until j == 39
                print(" ",$crt_screen[i][j].encode('utf-8').green)
                j+=1
            end
            i+=1
    end
end

$crt_screen = Array.new(6) do
    Array.new(40) do
        '░'
    end
end

File.readlines('input.txt').each do |line|
    cycle(line)
end

print("part1 ans: ",$signalsum,"\n")
PrintCRT()

print("\n")
