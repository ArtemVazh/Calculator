var curVal = ""
var memory = 0
var lastOp = ""

function fact(N) {
    if(N < 0)
        return 0;
    if (N === 0)
        return 1;
    else
        return N * fact(N - 1);
}

function doOperation(op) {
    if ((op >= "0" && op <= "9" || op == ".") && lastOp.length == 0) {
        if (op != '1/x') {
            if (display.text.toString() == "0" && op != ".") {
                display.text = op
            }
            else {
                display.text = display.text + op
            }
            return
        }
    }
    if ((op >= "0" && op <= "9" || op == ".") && lastOp.length != 0) {
        if (op != '1/x') {
            if (display.text == "1/") {
                display.text = op
                return
            }
            if (display.text.toString() == "0" && op != "." || display.text == lastOp) {
                display.text = op
            }
            else {
                display.text = display.text + op
            }
            return
        }
    }
    var allOperation = ['sin', 'cos', 'tan', 'sinh', 'cosh', 'tanh', 'exp', 'log', 'ln', '+', '-', '\u00d7', '\u00f7', 'n!', '^', 'y\u221a', '\u221a', "x\u00B2", "x\u00B3", "x^y", "\u00B3\u221a", '1/x'];
    var trigonometry = ['sin', 'cos', 'tan', 'sinh', 'cosh', 'tanh', 'exp', 'log', 'ln'];
    if (allOperation.indexOf(op) != -1 && lastOp.length != 0) {
        if (lastOp == "y\u221a") {
            memory = Math.pow(Number(display.text), 1/Number(curVal))
        }
        if (lastOp == "+") {
            memory = Number(curVal) + Number(display.text)
        }
        if (lastOp == "-") {
            memory = Number(curVal) - Number(display.text)
        }
        if (lastOp == "\u00d7") {
            memory = Number(curVal) * Number(display.text)
        }
        if (lastOp == "\u00f7") {
            if (display.text == "0") {
                display.text = "error"
                return
            }
            memory = Number(curVal) / Number(display.text)
        }
        if (lastOp == "^") {
            memory = Math.pow(Number(curVal), Number(display.text))
        }
        lastOp = op
        curVal = memory
        display.text = memory
    }
    if (op == "1/x" && display.text != "0") {
        memory = 1 / Number(display.text)
        curVal = memory
        display.text = memory
        return
    }
    if (op == "1/x" && display.text == "0") {
        curVal = "1"
        lastOp = "\u00f7"
        display.text = "1/"
        return
    }
    if(op =="n!" && Number(display.text) != Number.NaN) {
        memory = fact(Number(display.text))
        curVal = memory
        display.text = memory
        return
    }
    if (op == "\u03C0") {
        curVal = Math.PI
        display.text = curVal
        return
    }
    if (op == "\u221a") {
        memory = Math.sqrt(Number(display.text))
        curVal = memory
        display.text = memory
        return
    }
    if (op == "+" || op == "-" || op == "\u00d7" || op == "\u00f7") {
        lastOp = op
        curVal = display.text
        display.text = op
        return
    }
    if (trigonometry.indexOf(op) != -1) {
        if (op == "sin") {
            memory = Math.sin(Number(display.text))
        }
        if (op == "cos") {
            memory = Math.cos(Number(display.text))
        }
        if (op == "tan") {
            memory = Math.tan(Number(display.text))
        }
        if (op == "sinh") {
            var x = Number(display.text)
            memory = (Math.exp(x)-Math.exp(-x))/Number(2)
        }
        if (op == "cosh") {
            var x = Number(display.text)
            memory = (Math.exp(x)+Math.exp(-x))/Number(2)
        }
        if (op == "tanh") {
            var x = Number(display.text)
            memory = (Math.exp(x)-Math.exp(-x))/(Math.exp(x)+Math.exp(-x))
        }
        if (op == "exp") {
            memory = Math.exp(Number(display.text))
        }
        if (op == "ln") {
            memory = Math.log(Number(display.text))
        }
        if (op == "log") {
            memory = Math.log(Number(display.text)) / Math.log(2)
        }
        curVal = memory
        display.text = memory
        return
    }
    if (op == "x\u00B2" || op == "x\u00B3"){
        if (op == "x\u00B2") {
            memory = Math.pow(Number(display.text), 2)
        }
        if (op == "x\u00B3") {
            memory = Math.pow(Number(display.text), 3)
        }
        curVal = memory
        display.text = memory
        return
    }
    if (op == "x^y") {
        lastOp = "^"
        curVal = display.text
        display.text = "^"
        return
    }
    if (op == "\u00B3\u221a") {
        memory = Math.pow(Number(display.text), 1/3)
        curVal = memory
        display.text = memory
        return
    }
    if (op == "y\u221a") {
        lastOp = "y\u221a"
        curVal = display.text
        display.text = "y\u221a"
        return
    }
    if (op == "=") {
        if (lastOp == "y\u221a") {
            memory = Math.pow(Number(display.text), 1/Number(curVal))
        }
        if (lastOp == "+") {
            memory = Number(curVal) + Number(display.text)
        }
        if (lastOp == "-") {
            memory = Number(curVal) - Number(display.text)
        }
        if (lastOp == "\u00d7") {
            memory = Number(curVal) * Number(display.text)
        }
        if (lastOp == "\u00f7") {
            if (display.text == "0") {
                display.text = "error"
                return
            }
            memory = Number(curVal) / Number(display.text)
        }
        if (lastOp == "^") {
            memory = Math.pow(Number(curVal), Number(display.text))
        }
        curVal = memory
        display.text = memory
        return
    }
    if (op == "C") {
            curVal = 0
            memory = 0
            lastOp = ""
            display.text = "0"
            return
     }
    display.text = "error"
}
