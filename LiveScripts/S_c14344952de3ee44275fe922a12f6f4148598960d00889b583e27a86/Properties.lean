import LiveScripts.Shared
import LiveScripts.S_c14344952de3ee44275fe922a12f6f4148598960d00889b583e27a86.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c14344952de3ee44275fe922a12f6f4148598960d00889b583e27a86.script [ctx] 10000]
