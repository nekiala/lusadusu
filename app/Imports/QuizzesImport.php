<?php

namespace App\Imports;

use App\Quiz;
use Maatwebsite\Excel\Concerns\ToModel;

class QuizzesImport implements ToModel
{
    private $lesson_id;

    public function __construct(int $lesson_id)
    {
        $this->lesson_id = $lesson_id;
    }

    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new Quiz([
            'lesson_id' => $this->lesson_id,
            'question' => $row[0],
            'type' => $row[1]
        ]);
    }
}
