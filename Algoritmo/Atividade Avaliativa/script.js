function AssistirEpisodios() {
    episodio = document.getElementById('div_episodio')
    episodio.innerHTML = ''

    var numeroEpisodio = Number(input_episodio.value)
    const unidadeTempo = select_unidade_tempo.value
    const PularAbertura = select_pular_abertura.value
    const PularEncerramento = select_pular_encerramento.value
    var TempoDisponivel

    if (numeroEpisodio > 1100 || numeroEpisodio < 1) {
        alert('O número do episódio é inválido')
    } else {

        // Determinando o tempo do Episódio
        var TempoEpisodio = 24

        if (PularAbertura == 'sim' && PularEncerramento == 'sim') {
            TempoEpisodio = 20
        } else if (PularAbertura == 'sim' || PularEncerramento == 'sim') {
            TempoEpisodio = 22
        }

        // Realizando a conversão do tempo caso seja necessário
        if (unidadeTempo == 'horas') {
            TempoDisponivel = Number(input_qtd_tempo.value) * 60
        } else {
            TempoDisponivel = Number(input_qtd_tempo.value)
        }
        var TempoTotalGasto = 0
        // Inicio da lógica
        for (; TempoDisponivel > 0;) {
            episodio.innerHTML += `<p><b>Episódio: ${numeroEpisodio}</b><p>`
            numeroEpisodio++
            minutos = 1

            for (minutos; minutos <= TempoEpisodio; minutos++) {

                if (TempoDisponivel > 0 && minutos <= TempoEpisodio) {

                    if (minutos <= 2 && PularAbertura == 'nao') {
                        episodio.innerHTML += `Minuto ${minutos}: Assistindo abertura <br>`

                    } else if (minutos >= 20 && PularEncerramento == 'nao' && PularAbertura == 'simF') {
                        episodio.innerHTML += `Minuto ${minutos}: Assistindo encerramento<br>`
                    } else if (minutos >= 22 && PularEncerramento == 'nao' && PularAbertura == 'nao') {
                        episodio.innerHTML += `Minuto ${minutos}: Assistindo encerramento<br>`
                    } else {
                        episodio.innerHTML += `Minuto ${minutos}: Assistindo o episódio<br>`
                    }

                    TempoDisponivel--
                    TempoTotalGasto++
                }
            }
        }
        var qtdEpisodios = (TempoTotalGasto / TempoEpisodio)
        episodio.innerHTML += `<br> Fim dos episódios! 
        <br> Foram assistidos ${qtdEpisodios} episódios`
    }
}