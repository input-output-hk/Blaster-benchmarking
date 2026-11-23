import LiveScripts.Shared
import LiveScripts.S_b8b5eeaae47d63f8a1bc3592874ac849a7d5a27749d381968e2b7e32.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b8b5eeaae47d63f8a1bc3592874ac849a7d5a27749d381968e2b7e32.script [ctx] 10000]
