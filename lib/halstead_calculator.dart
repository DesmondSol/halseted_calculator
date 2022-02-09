import 'dart:math';

class HalsteadCalculator {
  int halstead_vocabulary(int n1, int n2) {
    return n1 + n2;
  }

  int halstead_length(int N1, int N2) {
    return N1 + N2;
  }

  double halstead_volume(int n1, int n2, int N1, int N2) {
    return (N1 + N2) * (log(n1 + n2)) / (log(2));
  }

  double halstead_difficulty(int n1, int n2, int N2) {
    return (n1 / 2) * (N2 / n2);
  }

  double halstead_level(int n1, int n2, int N2) {
    return (2 / n1) * (n2 / N2);
  }

  double halstead_Intelegence(int n1, int n2, int N1, int N2) {
    double v = (N1 + N2) * (log(n1 + n2)) / (log(2));
    double d = (n1 / 2) * (N2 / n2);
    return v / d;
  }

  double halstead_effort(int n1, int n2, int N1, int N2) {
    double v = (N1 + N2) * (log(n1 + n2)) / (log(2));
    double d = (n1 / 2) * (N2 / n2);
    return v * d;
  }

  double halstead_Time(int n1, int n2, int N1, int N2) {
    double v = (N1 + N2) * (log(n1 + n2)) / (log(2));
    double d = (n1 / 2) * (N2 / n2);
    double e = v * d;
    double B = 18;
    return e / B;
  }

  double halstead_remaining_bugs(int n1, int n2, int N1, int N2) {
    double v = (N1 + N2) * (log(n1 + n2)) / (log(2));
    double d = (n1 / 2) * (N2 / n2);
    double e = v * d;
    return pow(e * e, 1 / 3) / 3000;
  }

  double halstead_program_estimated_length(int n1, int n2) {
    return n1 * ((log(n1)) / log(2)) + n2 * ((log(n2)) / log(2));
  }
}
