#include <fcl/fcl.h>

int main() {
  const fcl::Sphere<double> sphere(1.0);
  return sphere.radius == 1.0 ? 0 : 1;
}
