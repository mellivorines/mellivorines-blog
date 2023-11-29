export default
{
    fpsLimit: 60,
    background: {
        color: "#000000"
    },
    interactivity: {
        detect_on: "window",
        events: {
            onHover: {
                enable: true,
                mode: ["bubble", "connect"]
            },
            resize: true
        },
        modes: {
            bubble: {
                distance: 200,
                duration: 2,
                opacity: 1,
                size: 30,
                speed: 3,
                color: {
                    value: ["#5bc0eb", "#fde74c", "#9bc53d", "#e55934", "#fa7921"]
                }
            },
            connect: {
                distance: 60,
                lineLinked: {
                    opacity: 0.2
                },
                radius: 200
            }
        }
    },
    particles: {
        color: {
            value: "#000000"
        },
        move: {
            direction: "none",
            enable: true,
            outMode: "out",
            random: false,
            speed: 2,
            straight: false
        },
        number: {
            density: {
                enable: true,
                value_area: 800
            },
            value: 300
        },
        opacity: {
            value: 0
        },
        shape: {
            type: "circle"
        },
        size: {
            random: {
                enable: true,
                minimumValue: 10
            },
            value: 15
        }
    },
    retina_detect: true
}