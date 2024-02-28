直接把所有文件下载到电脑的某个文件夹里，再在这个文件夹打开cmd，
并执行luac54 -o main.L main.lua | lua54 main.L就可以看到输出结果了，
如果你想要去对比自己的文件的差异，
你可以更改源码起始的2个变量的字符部分也就是"ShowA.bin"或是"ShowB.bin"，他们可以是绝对路径，随你
local f1name = "ShowA.bin"
local f2name = "ShowB.bin"

目前这就是这个lua字节差异演示的最终形态了，并没有考虑继续维护
所以有几个已知的缺点
1.比较文件的名不能是中文(其他语言我不清楚)
2.想要执行这个程序的局限性很大
3.作者是福瑞

Translated from Bing:
Download all the files directly to a folder on your computer, and then open cmd in this folder.
and execute luac54 -o main. L main.lua | lua54 main. L can see the output result,
If you want to compare the differences between your files,
You can change the character part of the first two variables in the source code, which is either "ShowA.bin" or "ShowB.bin", which can be absolute paths, whatever you want
local f1name = "ShowA.bin"
local f2name = "ShowB.bin"

At the moment, this is the final form of this LUA byte diff demo, and we don't think about continuing to maintain it
So there are several known drawbacks
1. The name of the comparison file cannot be Chinese (I don't know about other languages)
2. There are great limitations to wanting to execute this procedure
3. The author is Fury
