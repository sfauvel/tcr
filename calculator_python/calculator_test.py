# coding: utf-8
import unittest

from calculator import Calculator

class TestCalculator(unittest.TestCase):

    def test_add_2_number(self):
        calc = Calculator()

        self.assertEqual(5, calc.sum(2, 3))

    def test_add_negative_number(self):
        calc = Calculator()

        self.assertEqual(-5, calc.sum(-2, -3))

if __name__ == '__main__':
    unittest.main()
