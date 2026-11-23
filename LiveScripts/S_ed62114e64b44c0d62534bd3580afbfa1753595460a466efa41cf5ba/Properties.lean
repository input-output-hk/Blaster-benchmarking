import LiveScripts.Shared
import LiveScripts.S_ed62114e64b44c0d62534bd3580afbfa1753595460a466efa41cf5ba.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ed62114e64b44c0d62534bd3580afbfa1753595460a466efa41cf5ba.script [ctx] 10000]
