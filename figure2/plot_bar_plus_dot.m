function plot_bar_plus_dot(axe,id_x ,v_x,with_bar , state)
%this function is used to plot bar + dot figure
%axe :��ʾ������
%id_x ��ÿ��bar��λ��
%v_x ��ÿ��bar�ĸ߶�
%with_bar:ÿ��bar�Ŀ��
%state dot��״̬��1��ͬһ��ֵ��һ���Ͼ��ȷֲ���0�����ֲ���������
bar(axe,id_x',mean(v_x,1)',with_bar);
with_bar = with_bar*0.9;
hold(axe,'on');
for id_data = 1 : size(v_x,2)
    x_ing = v_x(:,id_data);
    uni_x = unique(x_ing,'stable');
    switch state
        case 1
            for i = 1:length(uni_x)
                n = sum(x_ing == uni_x(i));
                t = (with_bar/(n+1) : with_bar/(n+1):with_bar*n/(n+1))+id_x(id_data)-with_bar*0.5;
                plot(axe,t, x_ing(x_ing == uni_x(i)),'.k')
            end
        case 0
            plot(axe,repmat(id_x,size(v_x,1),1), v_x ,'.k')
    end
    
end
hold(axe,'on');
end