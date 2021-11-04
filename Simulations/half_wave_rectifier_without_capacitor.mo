model half_wave_rectifier_without_capacitor
  Modelica.Electrical.Analog.Sources.CosineVoltage cosineVoltage1(V = 12 * sqrt(2), freqHz = 50, phase = 0) annotation(Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Ideal.IdealDiode diode(Vknee = 0.7, Goff = 1e-15) annotation(Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 100) annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(resistor1.n, ground1.p) annotation(Line(visible = true, origin = {10, -15}, points = {{10, 5}, {10, 0}, {-10, 0}, {-10, -5}}, color = {10, 90, 224}));
  connect(cosineVoltage1.n, ground1.p) annotation(Line(visible = true, origin = {-15, -15}, points = {{-15, 5}, {-15, 0}, {15, 0}, {15, -5}}, color = {10, 90, 224}));
  connect(diode.n, resistor1.p) annotation(Line(visible = true, origin = {16.667, 16.667}, points = {{-6.667, 3.333}, {3.333, 3.333}, {3.333, -6.667}}, color = {10, 90, 224}));
  connect(diode.p, cosineVoltage1.p) annotation(Line(visible = true, origin = {-23.333, 16.667}, points = {{13.333, 3.333}, {-6.667, 3.333}, {-6.667, -6.667}}, color = {10, 90, 224}));
  annotation(experiment(StopTime = 0.05, __Wolfram_NumberOfIntervals = -1, __Wolfram_Algorithm = "dassl", Tolerance = 1e-10), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end half_wave_rectifier_without_capacitor;
