<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EventosRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'cod_evento'=> 'required',
            'nom_evento'=> 'required',
            'precio_entrada'=> 'required',
            'estado_evento'=> 'required',
        ];
    }
    public function messages(){
        return [
                'cod_evento.required'=>'Indique el código del evento.',
                'nom_evento.required'=>'Indique el nombre del evento.',
                'precio_entrada.required'=>'Indique el precio del evento.',
                'estado_evento.required'=>'Ingrese el estado del evento.',
        ];
    }
}
