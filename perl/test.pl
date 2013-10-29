#! /usr/bin/perl -w
use v5.14;
use strict;
use warnings;

my %h = ('123',"test");
say "$;";
say $^O;
#say $h{1,2,3};

=var $
say $(;
say $);
say $0;

=var $"
my @a = (1,3,4);
print "@a\n";
$" = ",";
print "@a\n";
say "1,3,4" =~ /@a/;

=fh
my $test = "/home/zengfb/Code/perl/lab.pl";
{
    open FH,$test or die qq(can't open:$!);
    while (my $line = <FH>) { print $line};
}

close FH;
=special var
sleep(2);
say qq(The PID of process perl.exe is: $$);
=file
my $filename = <>;
chomp $filename;
print `cat $filename`;
use File::Copy qw(copy);
copy $filename,'b.txt';

=file open&close
my $filename = 'whart/report.txt';
open(my $fh,'>',$filename) or die "Could not open file '$filename'. $!";
say "what is \$!:".$!;
say $fh "My first report generated by perl";
close $fh;
say "done";

=split
my @names = ('Foo', 'Bar', 'Moo');
my $str = join ':',@names;
say $str;
my @names1 = split ':',$str;
for (@names1) {
    say $_ x 2;
}

=hash
my %color_of;
$color_of{'apple'} = 'red';
my $fruit = 'apple';
say $color_of{$fruit};
$color_of{orange} = 'orange';
say $color_of{orange};
for my $fruit (keys %color_of) {
    say "The color of '$fruit' is $color_of{$fruit}";
}
say scalar keys %color_of;

=splice
my @array = qw(one two three four);
my @who = splice @array,-2,-1;
say @array;
say @who;

=splice
my @array = qw(one two three four);
my @other = (1,2,3,4);
my @removes = splice @array,0,0,1,2;
my $remove = splice @array,0,1,1,2;
say @array;
say @removes;
say $remove;

=splice
my @dwarfs = qw(Doc Grumpy Happy Sleepy Sneezy Dopey Bashful);
my @others = qw(zhi ma kai men);
splice @dwarfs, 3, 0, @others;
print "@dwarfs";
=array
use Data::Dumper qw(Dumper);

my @names = ("Foo","Bar","Baz");
my $first_value = shift @names;
unshift @names,"first";
say "First:$first_value";
say Dumper \@names;

=array
my @names = ("a",'b','c');
say $#names;
=Dumper
use Data::Dumper qw(Dumper);

my @names = ("Foo", "Bar", "Baz");
say Dumper \@names;

=updowntext
my $x;
say $x+4;
say 'Foo'.$x.'Bar';
$x++;
say $x;

=undef
my $x=undef;
if (defined $x) {
    say '$x is defined';
} else {
    say '$x is undef';
}

=numric?
use Scalar::Util qw(looks_like_number);

print "How many loaves of bread shall I buy?";
my $loaves = <STDIN>;
chomp $loaves;

if (looks_like_number($loaves)) {
    print "I am on it...\n";
} else {
    print "Sorry, I don't get it\n";
}

=updowntext
    my $x = "4T";
my $y = 3;
say $x + $y;

=rand
    my $z = int rand 5;
say "Input a number:";
while (my $guess = <>) {
    if ($guess == $z){
    say "you are get the right number";
last;
}
elsif ($guess > $z){
    say "too big";
}
else {
    say "too little";
}
}

=int
    my $x = int 3.14;
say $x;
my $z = int 3;
say $z;
my $w = int 3.9999;
say $w;
say int -3.14;


=substr
    my $str = "The black cat jumped from the green tree";
say index $str,'cat';
say index $str,'dog';
say index $str,'The';
say index $str,'the';
say rindex $str,'e ',22;
say substr $str,4,-1;
my $z = substr $str,14,1,"zfb";
say $z;
say $str;

=str
    my $str="HeLLo";
say lc $str;
say uc $str;
say length $str;

=stdin
    say "nums:";
my $num = <STDIN>;
chomp $num;
my @nums = split / /,$num;
my $result;
say "$result";
for (@nums){
    $result += $_;
}

say "result = $result";


=podmy @array = (23, 54, 12, 64, 23);
my $ret = diff(@array);
print "$ret\n";  	# 印出 52 (64 - 12)
my @array2 = (42, 33, 71, 19, 52, 3);
my $ret2 = diff(@array2);
print "$ret2\n";  # 印出 68 (71 - 3)
sub diff {
    my $max = shift;
    my $min = $max;
    for (@_) {
        $max = $_ if $_ > $max;
        $min = $_ if $_ < $min;
    }
    $max - $min;
}
=pod 多个参数
    my $return = &adv(4, 2, 6, 4, 9);  # 我們一次傳入五個參數
print $return;

sub adv {
    my $total;
    for (@_) {  			# 針對預設陣列進行運算
        $total += $_;			# 加總
    }
    $total/($#_+1);  		# 除以總數 (取平均)
}

=pod 多个参数
    my $return = &div(4,2);
print $return;

sub div {
    $_[0]/$_[1];
}
=pod 函数的返回值
    sub times {
        my $max = shift;  		# 把參數指定為變數$$max
        my $total = 1;  		# 如果不指定，預設會是0，那乘法會產生錯誤
        for (1...$$max) {  		# 從 1 到 $$max
            $total *= $_;			# 進行階乘的動作
        }
        return $total  		# 傳回總數
}
=pod 函数的参数
    &hello("world");

sub hello {
    my $name = shift @_;
    print "hello $name\n";
}
=pod 调用自己和内建函数的区别
    my $num = 12;
print hex($num),"\n";  	# 這是Perl提供的hex函式
print &hex($num),"\n";  	# 我們自己寫的hex副常式


sub hex {
    my $param = shift;
    $num*2;
}
=pod sub
    $var1 = "global";
&sub1;  				# 印出 sub1
print "$var1\n";  		# 印出 global
&sub2;  				# 現在變成 sub2
print "$var1\n";  		# 又回到 global

sub sub1 {
    my $var1 = "sub1";
    print "$var1\n";
}

sub sub2 {
    local $var1 = "sub2";
    print "$var1\n";
}
=pod sub
    my $return = &div(4,2);
print $return;
sub div {
    $_[0]/$_[1];
}
=pod sub
    my $return = &square(4);
print $return;

sub square {
    my $base = shift;
    $base**2;
}


=pod 副常式
    &hello;  	# 印出 hello
&hello;  	# 再印一次


sub hello {
    print "hello\n";
}

=pod hash
    my %hash = qw/John 1982.1.5 Paul 1978.11.3 Lee 1976.3.2 Mary 1980.6.23/;
$hash{Kayle} = '1978.6.12';
$hash{Ray} = '1978.5.29';
print %hash;
print "\n";
print map { "$_:$hash{$_} " } grep { (substr $hash{$_},0,3) eq '198' } keys %hash;
=pod hash
    my %hash = qw/1 one 2 two 3 three/;
my %hash = (1, 2, 3, 4, 5);
my %hash = (1 => 'one', 2 => 'two', 3 => 'three',);
my %hash = (4/2 => 3,);

while (my ($key, $value) = each (%hash)) {
    # 取出杂凑中灯每一对键值, 并且分别放入$key,$value
    print "$key => $value\n";
}
my %hash = (
    '168.1.2.1' => 'verdi',
    '192.1.2.2' => 'wagner',
    '168.1.2.3' => 'beethoven',);

=pod 基本的杂凑操作
    my %hash;
$hash{key} = 'value';
my %var;

=pod 输入一个数,如果大于50,提示太大;否则输出它的阶乘
    my $myin = <>;
my $myout=1;
if ($myin > 50) {
    print "输入值太大!\n"
} else {
    $myout *= $_ for (1...$myin) ; print $myout;
}
=pod 如果我们从1加到n,那么在累加结果不超过100,n的最大值应该是多少?
    my $a = 1;
my $result;
$result+= $a++ while ($result <=100);
print --$a;

=pod 1+3+5...+99
    my @array = qw/6 -4 8 12 -22 19 -8 42/;
my @positive;
for (@array) {
    push @positive, ($_**2) if ($_ > 0);
}
#print $_.' ' for (@positive);
my $result;
$result += $_ for grep { $_ % 2 != 0} (1...100);
print $result;

=pod loop 2
    print for (1...10);

=pod loop 1
    for my $num (1...10) {
    print $num;
}
=pod loop
    my $true = (1 < 2);
print $true;

my $num = 3;
$num++ if ($num < 5)
    if ($num < 5) {
    print "这不是真的";
} elsif () {
}

=pod firstcontrol
    my $num = <>;
chomp($num);
if ($num<5) {
    print "small";
} else {
    print "big";
}
print "\n";
=pod map
    my @array = qw/24 33 65 42 58 24 87/;
print "输入索引值:(0...6):\n";
my $index=<>;
print "该索引值$index对应的数值是:$array[$index]\n";
print sort @array;
print "\n";
print grep { $_>40 } (map { $_ . ' ' } @array);
print "\n";
print map { $_/10.0 . ' ' } @array;
print "\n";


=pod array
    print "please enter your name:\n";
my $name = <>;
chomp($name);
print "\n";
print "hello, $name\n";

my @array = qw{first second third};
$array[4] = 'fifth';
print $#array,"\n";
print $array[3],"\n";

my @array = qw{first second third};
push @array, 'fourth';
print $#array;  		# 這裡印出來的是3，表示'fortuh'已經被放入陣列
print @array,"\n";
pop @array;
print $#array;  		# 至於pop，則是把元素從陣列中取出
print @array,"\n";

my @array = qw/45 33 75 21 38 69 46/;
@array = sort { $a <=> $b } @array;

print join '.', qw/-4 45 -33 8 75 21 -15 38 -69 46/;
my @array = map { sqrt($_)*10 } qw/45 33 8 75 21 15 38 69 46/;
=pod abc
    my $name;
if (defined($name)) {
    print $name,"\n";
} else {
    print "it's undefined\n";
}
--------------array version 1-------------------
    my $first = '40';
my $second = '80';
my $third = '82';
...
    ...
    --------------array version 2-------------------
    my @array;
$array[0] = 'first';
$array[1] = 'second';
$array[2] = 'third';
--------------array version 3-------------------
    my ($array[0],$array[1],$array[2]) = qw/first second third.../;
my ($one, $two, $three) = (1,2,3);
--------------array version 4-------------------
    my @array = qw/first second third/;
my @array = (1 ... 10);
print array
=cut
#print "\n";
