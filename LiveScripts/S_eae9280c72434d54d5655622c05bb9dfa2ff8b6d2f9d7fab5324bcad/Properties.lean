import LiveScripts.Shared
import LiveScripts.S_eae9280c72434d54d5655622c05bb9dfa2ff8b6d2f9d7fab5324bcad.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_eae9280c72434d54d5655622c05bb9dfa2ff8b6d2f9d7fab5324bcad.script [ctx] 10000]
