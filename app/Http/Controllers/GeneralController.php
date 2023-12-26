<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class GeneralController extends Controller
{
    // Merge Arrays
    public function mergeArrays()
    {
        $array1 = array("User1" => "35", "User2" => "37", "User3" => "43");
        $array2 = array("User4" => "45", "User5" => "47", "User6" => "53");
        return response()->json(array_merge($array1, $array2));
    }

    // Filter Odd Numbers
    public function filterOddNumbers()
    {
        $array1 = [41, 83, 36, 96, 4, 47, 29, 4, 79, 146];
        if ($array1) {
            $oddNumberArray = [];
            foreach ($array1 as $value) {
                if ($value % 2 === 1)
                    $oddNumberArray[] = $value;
            }
        }
        return response()->json($oddNumberArray);
    }

    // Calculate Average
    public function calculateAverage()
    {
        $array1 = [41, 83, 36, 96, 4, 47, 29, 4, 79, 146];
        if ($array1) {
            $avg = array_sum($array1) / count($array1);
            return response()->json($avg);
        }
    }

    // Find Common Elements
    public function findCommonElements()
    {
        $array1 = [86, 83, 36, 96, 40, 47, 29, 4, 79, 146];
        $array2 = [2, 96, 78, 96, 4, 97, 83, 40, 179, 86];
        $commonNumbers = [];
        if ($array1 && $array2) {
            foreach ($array1 as $value) {
                if (in_array($value, $array2)) {
                    $commonNumbers[] = $value;
                }
            }
            return $commonNumbers;
        }
    }

    // Reverse String
    public function reverseString()
    {
        $str = "test tasks";
        return strrev($str);
    }

    // Count Vowels
    public function countVowels()
    {
        $string = "This is sample tasks";
        return substr_count($string, "a") + substr_count($string, "e") + substr_count($string, "i") + substr_count($string, "o") + substr_count($string, "u");
    }

    // Truncate Text
    public function truncateText()
    {
        $string = "This is sample tasks";
        $length = 10;
        return $this->truncateString($string, $length);
    }

    public function truncateString($string, $length)
    {
        return strlen($string) > $length ? substr($string, 0, $length) . "..." : $string;
    }
}
