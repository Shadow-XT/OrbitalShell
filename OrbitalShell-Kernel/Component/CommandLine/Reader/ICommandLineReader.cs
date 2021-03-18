﻿//#define dbg
using System;

using OrbitalShell.Component.CommandLine.Processor;
using OrbitalShell.Component.Console;

namespace OrbitalShell.Component.CommandLine.Reader
{
    public interface ICommandLineReader
    {
        IConsole Console { get; set; }
        Action<IAsyncResult> InputProcessor { get; set; }

        void Initialize(
            string prompt = null,
            ICommandLineProcessor clp = null,
            Delegates.ExpressionEvaluationCommandDelegate evalCommandDelegate = null);
        int BeginReadln(AsyncCallback asyncCallback, string prompt = null, bool waitForReaderExited = true, bool loop = true);
        void CleanUpReadln();
        string GetPrompt();
        void IgnoreNextKey();
        void ProcessCommandLine(string commandLine, Delegates.ExpressionEvaluationCommandDelegate evalCommandDelegate, bool outputStartNextLine = false, bool enableHistory = false, bool enablePrePostComOutput = true);
        int ReadCommandLine(string prompt = null, bool waitForReaderExited = true);
        void SendInput(string text, bool sendEnter = true, bool alwaysWaitForReaderExited = false);
        void SendNextInput(string text, bool sendEnter = true);
        void SetDefaultPrompt(string prompt);
        void SetPrompt(string prompt = null);
        void SetPrompt(CommandEvaluationContext context, string prompt);
        void StopBeginReadln();
        void WaitReadln();
    }
}