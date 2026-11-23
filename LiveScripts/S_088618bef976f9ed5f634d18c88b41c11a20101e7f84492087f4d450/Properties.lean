import LiveScripts.Shared
import LiveScripts.S_088618bef976f9ed5f634d18c88b41c11a20101e7f84492087f4d450.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_088618bef976f9ed5f634d18c88b41c11a20101e7f84492087f4d450.script [ctx] 10000]
