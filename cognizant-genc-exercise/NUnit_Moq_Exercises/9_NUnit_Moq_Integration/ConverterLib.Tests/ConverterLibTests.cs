using NUnit.Framework;
using Moq;
using ConverterLib;

namespace ConverterLib.Tests
{
    [TestFixture]
    public class ConverterTests
    {
        [Test]
        public void USDToEuro_ValidAmount_ConvertsCorrectly()
        {
            var mockFeed = new Mock<IDollarToEuroExchangeRateFeed>();
            mockFeed.Setup(m => m.GetExchangeRate()).Returns(0.85);

            var converter = new Converter(mockFeed.Object);
            Assert.That(converter.USDToEuro(100), Is.EqualTo(85));
        }
    }
}