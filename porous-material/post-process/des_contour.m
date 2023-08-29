function des_contour(variab,firsteval,interval)
    % figure
    % variab(variab(:, 2) > 15, 2) = 15;
    x = int32(round(variab(:,2))); x = double(x);
    % if x >= 15
    %     x = 15;
    % end
    y = variab(:,3)*100;
    u = variab(:,1)/mean(variab(:,1));
    
    % Create a grid of x and y values
    xg = linspace(min(x), max(x), length(variab(:,1)));
    yg = linspace(min(y), max(y), length(variab(:,1)));
    [X,Y] = meshgrid(xg,yg);
    
    % Interpolate the u values onto the grid
    Z = griddata(x,y,u,X,Y);
    
    % Plot the contour
    contourf(X, Y, Z, 'LineStyle', 'none', 'LevelStep', 0.01);
    xlabel('$N_{\rm unit}$');
    ylabel('$\bar{\mathcal{D}}$ $[\times 100]$');
    colormap jet
    h = colorbar;
    h.Label.Interpreter = 'latex';
    % h.Label.String = '$z$';
    h.FontName = 'LaTeX';
    h.TickLabelInterpreter = 'latex';
    % caxis([0 1]);
    hold on

    if length(variab(:,1)) == 300
        scatter(double(int32(variab(1:firsteval,2))), variab(1:firsteval,3)*100,10,'Marker','o','MarkerFaceColor', 'w', 'MarkerEdgeColor', 'k', 'LineWidth', 1)
        scatter(double(int32(variab(firsteval:firsteval+interval,2))), variab(firsteval:firsteval+interval,3)*100,20,'Marker','s','MarkerFaceColor', 'w', 'MarkerEdgeColor', 'k', 'LineWidth', 1)
        scatter(double(int32(variab(firsteval+interval:end,2))), variab(firsteval+interval:end,3)*100,30,'Marker','^','MarkerFaceColor', 'w', 'MarkerEdgeColor', 'k', 'LineWidth', 1)
    else
        scatter(double(int32(variab(1:100,2))), variab(1:100,3)*100,10,'Marker','o','MarkerFaceColor', 'w', 'MarkerEdgeColor', 'k', 'LineWidth', 1)
        scatter(double(int32(variab(101:end,2))), variab(101:end,3)*100,20,'Marker','^','MarkerFaceColor', 'w', 'MarkerEdgeColor', 'k', 'LineWidth', 1)
        % scatter(double(int32(variab(201:end,2))), variab(201:end,3)*100,30,'Marker','^','MarkerFaceColor', 'w', 'MarkerEdgeColor', 'k', 'LineWidth', 1)
    end
    set(0,'DefaultTextFontSize',25,'DefaultAxesFontSize',16)
    set(0,'DefaultTextInterpreter','latex')
    set(gca, 'TickLabelInterpreter', 'latex')
    set(gca,'FontName','latex')
    ax = gca;ax.PlotBoxAspectRatio = [1,1,1];
    % tightfig
end