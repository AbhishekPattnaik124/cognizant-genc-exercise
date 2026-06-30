using NUnit.Framework;
using UtilLib;

namespace UtilLib.Tests
{
    [TestFixture]
    public class UrlHostNameParserTests
    {
        [Test]
        public void ParseHostName_ValidUrl_ReturnsHostName()
        {
            Assert.That(UrlHostNameParser.ParseHostName("http://www.google.com/search"), Is.EqualTo("www.google.com"));
        }

        [Test]
        public void ParseHostName_InvalidUrl_ReturnsNull()
        {
            Assert.That(UrlHostNameParser.ParseHostName("invalid_url"), Is.Null);
        }
    }
}