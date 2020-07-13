<?php

namespace App\Http\Resources;

use App\Answer;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class Exam extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $query = array_keys($request->query());

        return [
            'id' => $this->id,
            'course_id' => $this->course_id,
            'user_id' => $this->user_id,
            'lesson_id' => $this->lesson_id,
            'started' => $this->started,
            'started_at' => $this->started_at,
            'finished_at' => $this->finished_at,
            'duration' => $this->duration,
            'normal_finish' => $this->normal_finish,
            'passed' => $this->passed,
            'percentage_obtained' => $this->percentage_obtained,
            'percentage_required' => $this->percentage_required,
            'can_visualize' => $this->can_visualize,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'related' => [
                'user' => $this->user,
                'course' => $this->course,
                'lesson' => $this->lesson,
            ],
            'answers' => $this->when(in_array('?answers', $query),
                Answer::formattedAnswersByExam($this->id))
        ];
    }
}
