model half_wave_rectifier
  Modelica.Electrical.Analog.Sources.CosineVoltage cosineVoltage1(V = 12 * sqrt(2), freqHz = 50) annotation(Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Ideal.IdealDiode diode(Vknee = 0.7, Goff = 1e-15) annotation(Placement(visible = true, transformation(origin = {-30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.Pin pin1 annotation(Placement(visible = true, transformation(origin = {-0, -20}, extent = {{-2.5, -2.5}, {2.5, 2.5}}, rotation = 0), iconTransformation(origin = {-38.667, 23.666}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.Pin pin2 annotation(Placement(visible = true, transformation(origin = {40, -20}, extent = {{-2.5, -2.5}, {2.5, 2.5}}, rotation = 0), iconTransformation(origin = {-30.667, 15.666}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = 3 * sqrt(2) / 2500) annotation(Placement(visible = true, transformation(origin = {-0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 100) annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Interfaces.Pin pin3 annotation(Placement(visible = true, transformation(origin = {0, 20}, extent = {{-2.5, -2.5}, {2.5, 2.5}}, rotation = 0), iconTransformation(origin = {-22.667, 7.666}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(capacitor1.n, pin1) annotation(Line(visible = true, origin = {-0, -15}, points = {{-0, 5}, {0, -5}}, color = {10, 90, 224}));
  connect(resistor1.n, pin2) annotation(Line(visible = true, origin = {40, -15}, points = {{0, 5}, {0, -5}}, color = {10, 90, 224}));
  connect(resistor1.p, pin3) annotation(Line(visible = true, origin = {26.667, 16.667}, points = {{13.333, -6.667}, {13.333, 3.333}, {-26.667, 3.333}}, color = {10, 90, 224}));
  connect(diode.n, pin3) annotation(Line(visible = true, origin = {-10, 20}, points = {{-10, 0}, {10, 0}}, color = {10, 90, 224}));
  connect(capacitor1.p, pin3) annotation(Line(visible = true, origin = {-0, 15}, points = {{-0, -5}, {0, 5}}, color = {10, 90, 224}));
  connect(pin1, pin2) annotation(Line(visible = true, origin = {20, -20}, points = {{-20, -0}, {20, 0}}, color = {10, 90, 224}));
  connect(ground1.p, pin2) annotation(Line(visible = true, origin = {40, -25}, points = {{0, -5}, {0, 5}}, color = {10, 90, 224}));
  connect(cosineVoltage1.n, pin1) annotation(Line(visible = true, origin = {-40, -16.667}, points = {{-20, 6.667}, {-20, -3.333}, {40, -3.333}}, color = {10, 90, 224}));
  connect(cosineVoltage1.p, diode.p) annotation(Line(visible = true, origin = {-53.333, 16.667}, points = {{-6.667, -6.667}, {-6.667, 3.333}, {13.333, 3.333}}, color = {10, 90, 224}));
  annotation(experiment(StopTime = 0.05, __Wolfram_NumberOfIntervals = -1, __Wolfram_Algorithm = "dassl", Tolerance = 1e-10), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end half_wave_rectifier;
