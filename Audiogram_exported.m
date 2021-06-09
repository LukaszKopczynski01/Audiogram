classdef Audiogram_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                     matlab.ui.Figure
        AudiogramPanel               matlab.ui.container.Panel
        ZakoczbadaniePanel           matlab.ui.container.Panel
        Label_2                      matlab.ui.control.Label
        ZakoczbadanieButton          matlab.ui.control.StateButton
        AutorzyPanel                 matlab.ui.container.Panel
        WEL18EC1S1Label              matlab.ui.control.Label
        ukaszKopczyskiLabel          matlab.ui.control.Label
        JakubWanatLabel              matlab.ui.control.Label
        BadaniePanel                 matlab.ui.container.Panel
        WybrbadanegouchaButtonGroup  matlab.ui.container.ButtonGroup
        UcholeweButton               matlab.ui.control.RadioButton
        UchopraweButton              matlab.ui.control.RadioButton
        RozpocznijbadanieButton      matlab.ui.control.StateButton
        KalibracjaPanel              matlab.ui.container.Panel
        NIEButton                    matlab.ui.control.Button
        TAKButton                    matlab.ui.control.Button
        CzysychadwikpoklikniciukalibracjiLabel  matlab.ui.control.Label
        KalibracjaButton             matlab.ui.control.Button
        Label                        matlab.ui.control.Label
        UIAxes                       matlab.ui.control.UIAxes
        UwagaPrzedrozpoczciembadaniaproszustawipoziomgonocinapooweLabel  matlab.ui.control.Label
    end

    
    methods (Access = public)
        
        function results = tone(app)
            
        end
    end
    

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 1070 711];
            app.UIFigure.Name = 'MATLAB App';

            % Create UwagaPrzedrozpoczciembadaniaproszustawipoziomgonocinapooweLabel
            app.UwagaPrzedrozpoczciembadaniaproszustawipoziomgonocinapooweLabel = uilabel(app.UIFigure);
            app.UwagaPrzedrozpoczciembadaniaproszustawipoziomgonocinapooweLabel.FontSize = 20;
            app.UwagaPrzedrozpoczciembadaniaproszustawipoziomgonocinapooweLabel.Position = [154 616 764 69];
            app.UwagaPrzedrozpoczciembadaniaproszustawipoziomgonocinapooweLabel.Text = 'Uwaga ! Przed rozpoczęciem badania proszę ustawić poziom głośności na połowe. ';

            % Create AudiogramPanel
            app.AudiogramPanel = uipanel(app.UIFigure);
            app.AudiogramPanel.TitlePosition = 'centertop';
            app.AudiogramPanel.Title = 'Audiogram';
            app.AudiogramPanel.FontWeight = 'bold';
            app.AudiogramPanel.Position = [33 18 1019 600];

            % Create UIAxes
            app.UIAxes = uiaxes(app.AudiogramPanel);
            title(app.UIAxes, 'Wykres badania audiogramem')
            xlabel(app.UIAxes, 'Częstotliwość [Hz]')
            ylabel(app.UIAxes, 'Ubytek słuchu [dB]')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.Position = [360 14 641 344];

            % Create KalibracjaPanel
            app.KalibracjaPanel = uipanel(app.AudiogramPanel);
            app.KalibracjaPanel.TitlePosition = 'centertop';
            app.KalibracjaPanel.Title = '1. Kalibracja';
            app.KalibracjaPanel.Position = [22 358 327 204];

            % Create Label
            app.Label = uilabel(app.KalibracjaPanel);
            app.Label.Position = [6 105 390 99];
            app.Label.Text = {'Przed rozpoczeciem badania nalezy skalibrować aplikacje.                   '; 'W tym celu proszę o naciśnięcie przycisku kalibracja'};

            % Create KalibracjaButton
            app.KalibracjaButton = uibutton(app.KalibracjaPanel, 'push');
            app.KalibracjaButton.Position = [113 97 100 22];
            app.KalibracjaButton.Text = 'Kalibracja';

            % Create CzysychadwikpoklikniciukalibracjiLabel
            app.CzysychadwikpoklikniciukalibracjiLabel = uilabel(app.KalibracjaPanel);
            app.CzysychadwikpoklikniciukalibracjiLabel.Position = [42 56 244 22];
            app.CzysychadwikpoklikniciukalibracjiLabel.Text = 'Czy słychać dźwięk po kliknięciu kalibracji ? ';

            % Create TAKButton
            app.TAKButton = uibutton(app.KalibracjaPanel, 'push');
            app.TAKButton.Position = [6 12 100 22];
            app.TAKButton.Text = 'TAK';

            % Create NIEButton
            app.NIEButton = uibutton(app.KalibracjaPanel, 'push');
            app.NIEButton.Position = [221 12 100 22];
            app.NIEButton.Text = {'NIE'; ''};

            % Create BadaniePanel
            app.BadaniePanel = uipanel(app.AudiogramPanel);
            app.BadaniePanel.TitlePosition = 'centertop';
            app.BadaniePanel.Title = '2. Badanie';
            app.BadaniePanel.Position = [428 370 505 192];

            % Create RozpocznijbadanieButton
            app.RozpocznijbadanieButton = uibutton(app.BadaniePanel, 'state');
            app.RozpocznijbadanieButton.Text = 'Rozpocznij badanie';
            app.RozpocznijbadanieButton.Position = [193 23 120 22];

            % Create WybrbadanegouchaButtonGroup
            app.WybrbadanegouchaButtonGroup = uibuttongroup(app.BadaniePanel);
            app.WybrbadanegouchaButtonGroup.Title = 'Wybór badanego ucha';
            app.WybrbadanegouchaButtonGroup.Position = [27 65 132 72];

            % Create UchopraweButton
            app.UchopraweButton = uiradiobutton(app.WybrbadanegouchaButtonGroup);
            app.UchopraweButton.Text = 'Ucho prawe';
            app.UchopraweButton.Position = [11 26 86 22];
            app.UchopraweButton.Value = true;

            % Create UcholeweButton
            app.UcholeweButton = uiradiobutton(app.WybrbadanegouchaButtonGroup);
            app.UcholeweButton.Text = 'Ucho lewe';
            app.UcholeweButton.Position = [11 4 78 22];

            % Create AutorzyPanel
            app.AutorzyPanel = uipanel(app.AudiogramPanel);
            app.AutorzyPanel.TitlePosition = 'centertop';
            app.AutorzyPanel.Title = 'Autorzy';
            app.AutorzyPanel.Position = [22 14 327 92];

            % Create JakubWanatLabel
            app.JakubWanatLabel = uilabel(app.AutorzyPanel);
            app.JakubWanatLabel.Position = [50 39 75 22];
            app.JakubWanatLabel.Text = 'Jakub Wanat';

            % Create ukaszKopczyskiLabel
            app.ukaszKopczyskiLabel = uilabel(app.AutorzyPanel);
            app.ukaszKopczyskiLabel.Position = [169 39 108 22];
            app.ukaszKopczyskiLabel.Text = 'Łukasz Kopczyński';

            % Create WEL18EC1S1Label
            app.WEL18EC1S1Label = uilabel(app.AutorzyPanel);
            app.WEL18EC1S1Label.Position = [112 18 83 22];
            app.WEL18EC1S1Label.Text = 'WEL18EC1S1';

            % Create ZakoczbadaniePanel
            app.ZakoczbadaniePanel = uipanel(app.AudiogramPanel);
            app.ZakoczbadaniePanel.TitlePosition = 'centertop';
            app.ZakoczbadaniePanel.Title = '3 Zakończ badanie';
            app.ZakoczbadaniePanel.Position = [29 162 314 121];

            % Create ZakoczbadanieButton
            app.ZakoczbadanieButton = uibutton(app.ZakoczbadaniePanel, 'state');
            app.ZakoczbadanieButton.Text = 'Zakończ badanie';
            app.ZakoczbadanieButton.Position = [100 11 107 22];

            % Create Label_2
            app.Label_2 = uilabel(app.ZakoczbadaniePanel);
            app.Label_2.HorizontalAlignment = 'center';
            app.Label_2.Position = [44 45 227 42];
            app.Label_2.Text = {'Po zakończeniu badania '; 'naciśnij przycisk zakończ badanie '; 'Wyniki zostaną automatycznie zapisane. '};

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Audiogram_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end