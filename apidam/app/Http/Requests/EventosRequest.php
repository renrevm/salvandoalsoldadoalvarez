<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

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
            if ($this->isMethod('post')) {
                return [
                    'cod_evento'=> 'required|min:3|unique:eventos,cod_evento',
                    'nom_evento'=> 'required',
                    'precio_entrada'=> 'required|numeric|gte:1',
                    //'estado_evento'=> 'required',
                ];
            }elseif($this->isMethod('put')) {
                return [
                    'cod_evento'=> 'required|min:3|unique:eventos,cod_evento,'.$this->cod_evento_new.',cod_evento',
                    'nom_evento'=> 'required',
                    'precio_entrada'=> 'required|numeric|gte:1',
                    //'estado_evento'=> 'required',
                ];
            }
                
            /*
            'cod_evento'=> 'required|min:3',
            'nom_evento'=> 'required',
            'precio_entrada'=> 'required|numeric|gte:1',
            //'estado_evento'=> 'required',*/
    }
    public function messages(){
        return [
                'cod_evento.required'=>'Indique el código del evento.',
                'cod_evento.min'=>'El código de evento debe tener al menos 3 caracteres.',
                'cod_evento.unique'=>'El código del evento está repetido, intente otro.',
                'nom_evento.required'=>'Indique el nombre del evento.',
                'precio_entrada.required'=>'Indique el precio del evento.',
                'precio_entrada.numeric'=>'Precio debe ser un numero.',
                'precio_entrada.gte'=>'Precio no puede ser 0.',
                'estado_evento.required'=>'Ingrese el estado del evento.',
        ];
    }
}
