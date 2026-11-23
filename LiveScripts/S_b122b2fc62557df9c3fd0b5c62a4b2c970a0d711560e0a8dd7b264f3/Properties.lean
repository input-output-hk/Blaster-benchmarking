import LiveScripts.Shared
import LiveScripts.S_b122b2fc62557df9c3fd0b5c62a4b2c970a0d711560e0a8dd7b264f3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b122b2fc62557df9c3fd0b5c62a4b2c970a0d711560e0a8dd7b264f3.script [redeemer, ctx] 10000]
