//Desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF para obter mais informações

function scrHoverSound(_mouseX, _mouseY, _recTX, _recTY, _recTX2, _recTY2)
{
    // Verifica se o mouse está dentro da área retangular especificada
    if (point_in_rectangle(_mouseX, _mouseY, _recTX, _recTY, _recTX2, _recTY2))
    {
        // Verifica se o som ainda não foi tocado
        if (!global.hoverSound)
        {
            // Toca o som
            audio_play_sound(sndHover1, 1, false);
            
            // Marca que o som foi tocado
            global.hoverSound = true;
        }
    }
    else
    {
        // Se o mouse saiu da área, reseta a flag para permitir que o som seja tocado novamente
        global.hoverSound = false;
    }
}