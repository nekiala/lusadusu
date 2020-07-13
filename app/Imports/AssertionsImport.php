<?php

namespace App\Imports;

use App\Assertion;
use Maatwebsite\Excel\Concerns\ToModel;

class AssertionsImport implements ToModel
{
    private $quiz_id;

    public function __construct($quiz_id)
    {
        $this->quiz_id = $quiz_id;
    }

    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new Assertion([
            'quiz_id' => $this->quiz_id,
            'answer' => $row[0],
            'correct_answer' => $row[1],
        ]);
    }
}
