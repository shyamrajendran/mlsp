function [] = myknnhelper(X, Y, N, level, k)
    lenk = size(k,2);
    [classA, classB] = clasifyGroup(X, 200, Y)
    [c1, c2] = meshgrid(min(X(:,1)):0.1:max(X(:,1)),min(X(:,2)):0.1:max(X(:,2)));
    str = sprintf('Classification Problem Type %d', level-2);
    figure('Name',str, 'NumberTitle','off')
    for i = 1: lenk
        cur_k = k(i);
        op = zeros(size(c1));      
        % finding distance to the present point for all in data
        for j = 1: length(c1(:))
            x = c1(j);
            y = c2(j);
            dis = zeros(200, 1);
            for l = 1 : 200
                dis(l) = (X(l,1) - x).^2 + (X(l,2) - y).^2;
            end
            [val, index] = sort(dis);
            
            % classify into two classes here A and B and finding its count
            Ac = 0;
            Bc = 0;
            for p = 1: cur_k
                if (Y(index(p)) == 1)
                    Ac = Ac + 1;
                else
                    Bc = Bc + 1;
                end
            end
            
            % finding which class points is max around this point
            if Ac > Bc
                op(j) = 1;
            else
                op(j) = -1;
            end
        end
        i
        subplot(3,2,i);
        plot(classA(:,1), classA(:,2), 'or')
        hold on
        plot(classB(:,1), classB(:,2), 'ob')
        contour(c1, c2, op, 2, 'k');
        hold off
        title([int2str(k(i)) ' - nearest neighbours'])
    end
end