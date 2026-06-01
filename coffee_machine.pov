// ============================================================
// coffee_machine.pov
// Полный кофеавтомат как один переиспользуемый объект
//
// Использование в другом проекте:
//   #declare Open_Angle = 90;
//   #include "coffee_machine.pov"
//   object { CoffeeMachine translate <X, Y, Z> }
// ============================================================

#ifndef (Open_Angle)
    #declare Open_Angle = 0;
#end

#declare CoffeeMachine = union {

    // --------------------------------------------------------
    // КОФЕАВТОМАТ (корпус + передняя дверца)
    // --------------------------------------------------------

    // корпус (задняя/внутренняя часть)
    box {
        <-19.2, 11, -16>, <-29.8, 31.8, 3.8>
        texture {
            pigment {
                image_map {
                    png "textures/coffee_machine_inside.png"
                    interpolate 2
                    once
                }
                scale <10.6, 20.8, 1>
                scale <-1, 1, 1>
                translate <-19.2, 11, 0>
            }
            finish { ambient 0.3 diffuse 0.7 }
        }
    }

    // передняя дверца (анимируемая)
    union {
        box {
            <-19.2, 11.2, 3.9>, <-29.8, 31.8, 5>
            texture {
                pigment {
                    image_map {
                        png "textures/coffee_machine.png"
                        interpolate 2
                    }
                    translate <19.2, -11.2, 0>
                    scale <10.6, 20.6, 1>
                }
                finish { ambient 0.3 diffuse 0.7 }
            }
        }
        translate <29.8, 0, -3.9>
        rotate <0, -Open_Angle * clock, 0>
        translate <-29.8, 0, 3.9>
    }

    // --------------------------------------------------------
    // ШКАФЧИК НАД КОФЕМАШИНОЙ
    // --------------------------------------------------------

    // нижняя полка шкафчика
    box {
        <-19, 32, -16>, <-30, 33, 5>
        pigment { color Gray10 }
    }

    // правая боковая стенка шкафчика
    box {
        <-30, 32, -10>, <-31, 44, 5>
        pigment { color Gray10 }
    }

    // передняя дверца шкафчика (анимируемая)
    union {
        // панель дверцы
        box {
            <-19.2, 33, 4>, <-30, 43, 5>
            pigment { color Gray10 }
        }

        // наклейка podaroc.png
        box {
            <-7, -7, 0>, <7, 7, 0.01>
            texture {
                pigment {
                    image_map {
                        png "textures/podaroc.png"
                        interpolate 2
                        once
                    }
                    translate <-0.5, -0.5, 0>
                    scale <-7, 7, 1>
                }
                finish { ambient 0.5 diffuse 0.5 }
            }
            translate <-24.6, 38, 5.01>
        }

        // наклейка buyers.png
        box {
            <0, 0, 0>, <-6, 2.2, 0.01>
            texture {
                pigment {
                    image_map {
                        png "textures/buyers.png"
                        interpolate 2
                        once
                    }
                    scale <-6, 2.2, 1>
                }
                finish { ambient 0.5 diffuse 0.5 }
            }
            translate <-19.4, 32, 5.02>
        }

        // ручка (внешняя сфера)
        sphere {
            <-20.7, 36.5, 4.9>, 0.4
            pigment { color Gray50 }
        }

        // ручка (внутренняя сфера)
        sphere {
            <-20.7, 36.5, 5.16>, 0.15
            pigment { color Black }
        }
    }

}
