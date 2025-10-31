using NLog;

namespace Ciribob.DCS.SimpleRadio.Standalone.Common.Helpers;

/// <summary>
/// Simple version information class for SuperSimpleRadio
/// All update functionality removed
/// </summary>
public class UpdaterChecker
{
    private static UpdaterChecker _instance;
    private static readonly object _lock = new();
    
    public static readonly string VERSION = "1.0.0.0";
    public static readonly string MINIMUM_PROTOCOL_VERSION = "1.9.0.0";
    private static readonly Logger _logger = LogManager.GetCurrentClassLogger();

    public static UpdaterChecker Instance
    {
        get
        {
            lock (_lock)
            {
                if (_instance == null) _instance = new UpdaterChecker();
            }
            return _instance;
        }
    }

    /// <summary>
    /// Gets the current version string
    /// </summary>
    public string GetVersion()
    {
        return VERSION;
    }

    /// <summary>
    /// Logs version information
    /// </summary>
    public void LogVersionInfo()
    {
        _logger.Info($"SuperSimpleRadio version: {VERSION}");
    }
}