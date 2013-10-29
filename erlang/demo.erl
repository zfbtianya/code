%串行编程,模块包含多个函数,函数在外部的调用需要导出.前面要加模块名,用:隔开.
%函数的命名用原子,参数用','隔开,赋值用箭头,模式匹配求值,不同的模式之间用;隔开.最后用.%结束.','在语句之间表示顺序执行,';'在语句之间表示并行执行.
%数值:如12,12.00,-12,12e12,-12E-22.
%原子:abc,'abc'
%复合类型:{},[]
%模式识别:变量赋值和流程控制.模式和项式匹配;成功就把模式中的变量绑定到项式中相%应的数据结构.
%匹配原语"=",右结合,取右值.
%并发,spawn启动一个进程,send发送消息,receive接收消息.
%spawn/3启动一个并发进程并返回标识符.


-module(demo).
-export([double/1,factorial/1,area/1,go/0,loop/0]).

double(X) ->
    times(X,2).
times(X,N) ->
    X * N.
factorial(0) ->
    1;
factorial(N) -> N *factorial(N-1).

area({square, Side})->
    Side * Side;
area({circle, Radius}) ->
    % almost :-)
    3 * Radius * Radius;
area({triagle, A, B, C}) ->
    S = (A+B+C)/2,
    math:sqrt(S*(S-A)*(S-B)*(S-C));
area(Other) ->
    {invalid_object, Other}.
go() ->
    Pid2 = spawn(demo,loop,[]),
    Pid2 ! {self(),hello},
    receive
        {Pid2, Msg} ->
            io:format("P1 ~w~n",[Msg])
    end,
    Pid2 ! stop.
loop()->
    receive
        {From,Msg}->
            From ! {self(),Msg},
            loop();
        stop ->
            true
    end.



