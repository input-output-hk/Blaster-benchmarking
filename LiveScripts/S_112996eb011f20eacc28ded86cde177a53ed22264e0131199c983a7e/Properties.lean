import LiveScripts.Shared
import LiveScripts.S_112996eb011f20eacc28ded86cde177a53ed22264e0131199c983a7e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_112996eb011f20eacc28ded86cde177a53ed22264e0131199c983a7e.script [ctx] 10000]
