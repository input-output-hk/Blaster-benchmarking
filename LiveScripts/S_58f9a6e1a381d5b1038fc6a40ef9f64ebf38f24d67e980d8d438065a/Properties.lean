import LiveScripts.Shared
import LiveScripts.S_58f9a6e1a381d5b1038fc6a40ef9f64ebf38f24d67e980d8d438065a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_58f9a6e1a381d5b1038fc6a40ef9f64ebf38f24d67e980d8d438065a.script [ctx] 10000]
