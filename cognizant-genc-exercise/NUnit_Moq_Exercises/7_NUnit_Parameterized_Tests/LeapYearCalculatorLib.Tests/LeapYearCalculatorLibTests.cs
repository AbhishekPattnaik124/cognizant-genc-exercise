using NUnit.Framework;
using LeapYearCalculatorLib;

namespace LeapYearCalculatorLib.Tests
{
    [TestFixture]
    public class LeapYearTests
    {
        [TestCase(2000, 1)]
        [TestCase(2004, 1)]
        [TestCase(1900, 0)]
        [TestCase(2001, 0)]
        [TestCase(1000, -1)]
        public void IsLeapYear_VariousYears_ReturnsExpected(int year, int expected)
        {
            Assert.That(LeapYearCalculator.IsLeapYear(year), Is.EqualTo(expected));
        }
    }
}