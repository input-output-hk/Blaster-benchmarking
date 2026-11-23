import LiveScripts.Shared
import LiveScripts.S_09d6705c8c91b19853a30116dbb4235442641cab97704cd633ab0b35.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_09d6705c8c91b19853a30116dbb4235442641cab97704cd633ab0b35.script [ctx] 10000]
