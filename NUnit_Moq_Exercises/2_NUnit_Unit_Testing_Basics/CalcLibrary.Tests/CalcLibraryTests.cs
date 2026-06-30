using NUnit.Framework;
using CalcLibrary;
using System;

namespace CalcLibrary.Tests
{
    [TestFixture]
    public class CalculatorTests
    {
        private SimpleCalculator _calc;
        [SetUp]
        public void SetUp() { _calc = new SimpleCalculator(); }

        [Test]
        public void Addition_ValidInput_ReturnsCorrectSum()
        {
            Assert.That(_calc.Addition(10, 20), Is.EqualTo(30));
        }

        [TestCase(10, 5, 5)]
        [TestCase(20, 10, 10)]
        public void Subtraction_ValidInput_ReturnsDifference(double a, double b, double expected)
        {
            Assert.That(_calc.Subtraction(a, b), Is.EqualTo(expected));
        }

        [TestCase(10, 5, 50)]
        public void Multiplication_ValidInput_ReturnsProduct(double a, double b, double expected)
        {
            Assert.That(_calc.Multiplication(a, b), Is.EqualTo(expected));
        }

        [TestCase(10, 2, 5)]
        public void Division_ValidInput_ReturnsQuotient(double a, double b, double expected)
        {
            Assert.That(_calc.Division(a, b), Is.EqualTo(expected));
        }

        [Test]
        public void Division_ByZero_ThrowsArgumentException()
        {
            try {
                _calc.Division(10, 0);
                Assert.Fail("Division by zero");
            } catch (ArgumentException) {
                Assert.Pass();
            }
        }

        [Test]
        public void TestAddAndClear()
        {
            _calc.Addition(5, 5);
            Assert.That(_calc.GetResult, Is.EqualTo(10));
            _calc.AllClear();
            Assert.That(_calc.GetResult, Is.EqualTo(0));
        }
    }
}