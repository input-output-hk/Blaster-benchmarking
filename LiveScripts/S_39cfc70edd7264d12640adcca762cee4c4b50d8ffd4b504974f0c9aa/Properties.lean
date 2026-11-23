import LiveScripts.Shared
import LiveScripts.S_39cfc70edd7264d12640adcca762cee4c4b50d8ffd4b504974f0c9aa.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_39cfc70edd7264d12640adcca762cee4c4b50d8ffd4b504974f0c9aa.script [ctx] 10000]
