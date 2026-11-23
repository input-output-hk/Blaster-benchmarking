import LiveScripts.Shared
import LiveScripts.S_15217aa12f7d8a9714f38c49c813707bb91c20e3b68c3b9df3d54ee0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_15217aa12f7d8a9714f38c49c813707bb91c20e3b68c3b9df3d54ee0.script [ctx] 10000]
