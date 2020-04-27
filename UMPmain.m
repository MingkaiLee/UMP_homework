% 运筹学UMP编程作业的主程序
[x_st_1,f_st_1]=st([0;0],1e-10,1);
size(f_st_1,2)
x_st_1(:,end)
f_st_1(end)
subplot(3,2,1),plot(f_st_1),title('l1最速下降');
clear
[x_st_2,f_st_2]=st([0;0],1e-10,2);
size(f_st_2,2)
x_st_2(:,end)
f_st_2(end)
subplot(3,2,3),plot(f_st_2),title('l2最速下降');
clear
[x_st_0,f_st_0]=st([0;0],1e-10,0);
size(f_st_0,2)
x_st_0(:,end)
f_st_0(end)
subplot(3,2,5),plot(f_st_0),title('linf最速下降');
clear
[x_cg_1,f_cg_1]=cg([0;0],1e-10,1);
size(f_cg_1,2)
x_cg_1(:,end)
f_cg_1(end)
subplot(3,2,2),plot(f_cg_1),title('F-R共轭梯度');
clear
[x_cg_2,f_cg_2]=cg([0;0],1e-10,2);
size(f_cg_2,2)
x_cg_2(:,end)
f_cg_2(end)
subplot(3,2,4),plot(f_cg_2),title('P-R共轭梯度');
clear
[x_cg_3,f_cg_3]=cg([0;0],1e-10,3);
size(f_cg_3,2)
x_cg_3(:,end)
f_cg_3(end)
subplot(3,2,6),plot(f_cg_3),title('B-S共轭梯度');
clear
