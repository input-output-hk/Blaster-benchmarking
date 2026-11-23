import LiveScripts.Shared
import LiveScripts.S_a1a3e3186b8f97e3e4ff7bc7b28952e62acdfed42e3f3c97fadbe9f3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a1a3e3186b8f97e3e4ff7bc7b28952e62acdfed42e3f3c97fadbe9f3.script [ctx] 10000]
