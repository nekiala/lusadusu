<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Lesson extends JsonResource
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
            'course_id' => $this->course_id,
            'title' => $this->title,
            'description' => $this->description,
            'link' => $this->link,
            'status' => $this->status,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'related' => $this->when(
                in_array('related', $query),
                [
                    'course' => $this->course,
                    'quizzes' => $this->quizzes,
                    'exams' => $this->exam_count
                ]
            )
        ];
    }
}
