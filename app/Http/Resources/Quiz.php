<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Quiz extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $query = array_keys($request->query());

        return [
            'id' => $this->id,
            'lesson_id' => $this->lesson_id,
            'question' => $this->question,
            'type' => $this->type,
            'status' => $this->status,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'related' => $this->when(
                in_array('related', $query),
                [
                    'lesson' => $this->lesson,
                    'assertions' => $this->assertions
                ]
            )
        ];
    }
}
