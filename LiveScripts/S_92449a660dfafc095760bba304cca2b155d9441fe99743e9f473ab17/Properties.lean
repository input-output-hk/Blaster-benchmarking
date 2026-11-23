import LiveScripts.Shared
import LiveScripts.S_92449a660dfafc095760bba304cca2b155d9441fe99743e9f473ab17.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_92449a660dfafc095760bba304cca2b155d9441fe99743e9f473ab17.script [ctx] 10000]
