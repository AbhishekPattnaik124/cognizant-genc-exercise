using NUnit.Framework;
using FourSeasonsLib;

namespace FourSeasonsLib.Tests
{
    [TestFixture]
    public class SeasonsTests
    {
        private static object[] SeasonCases =
        {
            new object[] { "February", "Spring" },
            new object[] { "May", "Summer" },
            new object[] { "August", "Monsoon" },
            new object[] { "October", "Autumn" },
            new object[] { "December", "Winter" },
            new object[] { "Invalid", "Unknown" }
        };

        [TestCaseSource(nameof(SeasonCases))]
        public void GetSeason_ValidMonth_ReturnsSeason(string month, string expected)
        {
            Assert.That(Seasons.GetSeason(month), Is.EqualTo(expected));
        }
    }
}