<?php

namespace App\Imports;

use App\Course;
use App\Lesson;
use Illuminate\Database\Eloquent\Model;
use Maatwebsite\Excel\Concerns\ToModel;

class LessonsImport implements ToModel
{
    /**
     * @var int $course_id
     */
    private $course_id;

    public function __construct(int $course_id)
    {
        $this->course_id = $course_id;
    }

    /**
    * @param array $row
    *
    * @return Model|null
    */
    public function model(array $row)
    {
        return new Lesson([
            'course_id' => $this->course_id,
            'title' => $row[0],
            'description' => $row[1],
            'link' => $row[2]
        ]);
    }
}
