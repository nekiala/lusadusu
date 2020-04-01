<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Course extends JsonResource
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
            'material_id' => $this->material_id,
            'title' => $this->title,
            'description' => $this->description,
            'mode' => $this->mode,
            'status' => $this->status,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'related' => $this->when(
                in_array('related', $query),
                [
                    'material' => $this->material,
                    'lessons_count' => $this->lesson_count,
                    'lessons' => $this->lessons,
                ]
            )
        ];
    }
}
