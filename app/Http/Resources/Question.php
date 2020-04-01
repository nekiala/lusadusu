<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Question extends JsonResource
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
            'category_id' => $this->category_id,
            'user_id' => $this->user_id,
            'subject' => $this->subject,
            'description' => $this->description,
            'notify' => $this->notify,
            'is_public' => $this->is_public,
            'status' => $this->status,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'related' => $this->when(
                in_array('related', $query),
                [
                    'category' => $this->category->name,
                    'user' => $this->user->name,
                    'discussions' => $this->discussions
                ]
            )
        ];
    }
}
