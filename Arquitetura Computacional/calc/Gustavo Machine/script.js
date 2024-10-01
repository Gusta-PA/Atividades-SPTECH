function converter() {
    var inputValue1 = document.getElementById('inputValue1').value;
    var inputBase1 = document.getElementById('inputBase1').value;

    if (!validarEntrada(inputValue1, inputBase1)) {
        alert('Por favor, insira um número válido para a base selecionada.');
        return;
    }

    var decimalValue1 = parseInt(inputValue1, inputBase1 === 'hexadecimal' ? 16 : inputBase1 === 'octal' ? 8 : inputBase1 === 'binario' ? 2 : 10);
    var outputHTML = '';

    if (document.getElementById('convertDecimal').checked) {
        outputHTML += `<p>Decimal: ${decimalValue1}</p>`;
    }
    if (document.getElementById('convertHexadecimal').checked) {
        outputHTML += `<p>Hexadecimal: ${decimalValue1.toString(16).toUpperCase()}</p>`;
    }
    if (document.getElementById('convertOctal').checked) {
        outputHTML += `<p>Octal: ${decimalValue1.toString(8)}</p>`;
    }
    if (document.getElementById('convertBinario').checked) {
        outputHTML += `<p>Binário: ${decimalValue1.toString(2)}</p>`;
    }

    document.getElementById('output').style.display = 'block';
    document.getElementById('output').innerHTML = outputHTML;
}

// Função para realizar operações matemáticas entre os valores
function operar(operacao) {
    var inputValue1 = document.getElementById('inputValue1').value;
    var inputValue2 = document.getElementById('inputValue2').value;
    var inputBase1 = document.getElementById('inputBase1').value;
    var inputBase2 = document.getElementById('inputBase2').value;

    if (!validarEntrada(inputValue1, inputBase1) || !validarEntrada(inputValue2, inputBase2)) {
        alert('Por favor, insira números válidos para as bases selecionadas.');
        return;
    }

    var decimalValue1 = parseInt(inputValue1, inputBase1 === 'hexadecimal' ? 16 : inputBase1 === 'octal' ? 8 : inputBase1 === 'binario' ? 2 : 10);
    var decimalValue2 = parseInt(inputValue2, inputBase2 === 'hexadecimal' ? 16 : inputBase2 === 'octal' ? 8 : inputBase2 === 'binario' ? 2 : 10);

    var resultado;
    if (operacao === 'somar') {
        resultado = decimalValue1 + decimalValue2;
    } else if (operacao === 'subtrair') {
        resultado = decimalValue1 - decimalValue2;
    } else if (operacao === 'multiplicar') {
        resultado = decimalValue1 * decimalValue2;
    } else if (operacao === 'dividir') {
        if (decimalValue2 === 0) {
            alert('Divisão por zero não é permitida.');
            return;
        }
        resultado = decimalValue1 / decimalValue2;
    }

    var outputHTML = `<p>Resultado em Decimal: ${resultado}</p>`;
    if (document.getElementById('convertHexadecimal').checked) {
        outputHTML += `<p>Resultado em Hexadecimal: ${resultado.toString(16).toUpperCase()}</p>`;
    }
    if (document.getElementById('convertOctal').checked) {
        outputHTML += `<p>Resultado em Octal: ${resultado.toString(8)}</p>`;
    }
    if (document.getElementById('convertBinario').checked) {
        outputHTML += `<p>Resultado em Binário: ${resultado.toString(2)}</p>`;
    }

    document.getElementById('output').style.display = 'block';
    document.getElementById('output').innerHTML = outputHTML;
}

// Função para validar a entrada de acordo com a base selecionada
function validarEntrada(inputValue, inputBase) {
    var validChars = '';

    if (inputBase === 'decimal') {
        validChars = '0123456789';
    } else if (inputBase === 'hexadecimal') {
        validChars = '0123456789ABCDEFabcdef';
    } else if (inputBase === 'octal') {
        validChars = '01234567';
    } else if (inputBase === 'binario') {
        validChars = '01';
    }

    for (var i = 0; i < inputValue.length; i++) {
        if (validChars.indexOf(inputValue[i]) === -1) {
            return false;
        }
    }
    return true;
}